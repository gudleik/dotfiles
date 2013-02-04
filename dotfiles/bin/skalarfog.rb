#!/usr/bin/env ruby
require "rubygems"
require "thor"
require "fileutils"

class SkalarFog < Thor
  include Thor::Actions

  desc "update <APPNAME>", "asset precompile, bundle package, af update, clean up"

  def update(manifest = default_manifest)
    manifest = find_manifest_file(manifest)
    fail ArgumentError, "No such manifest" if manifest.nil?
    say_status :deploying, "using #{manifest}"

    precompile && bundle_package && deploy_to_appfog(manifest) &&
    clean_assets && clean_bundle_package
  end

  private

  def default_manifest
    "manifest.yml"
  end

  def find_manifest_file(manifest)
    [ manifest, "#{manifest}.yml", "#{manifest}.manifest.yml" ].select { |file| File.exists?(file) }.first
  end

  def precompile
    run 'rake assets:precompile'
  end

  def bundle_package
    run 'bundle package'
  end

  def deploy_to_appfog(manifest)
    run "af update --manifest #{manifest}"
  end

  def clean_assets
    run 'rake assets:clean'
  end

  def clean_bundle_package
    FileUtils.rm_rf directory_where_bundle_package_things
  end

  def directory_where_bundle_package_things
    Dir.pwd + "/vendor/cache"
  end
end

SkalarFog.start
