#!/usr/bin/env ruby

# Based on example from:
#   http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

git_bundles = [
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/wincent/Command-T.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tsaleh/vim-supertab.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/int3/vim-taglist-plus.git",
  "git://github.com/mileszs/ack.vim.git",
]

vim_org_scripts = [
  ["puppet_syntax", "8052", "syntax"],
  ["json", "10853", "syntax"],
  ["IndexedSearch", "7062",  "plugin"],
  ["guicolorscheme", "10162", "plugin"]
]

vim_org_zips = [
  ["puppet_syntax", "8052"]
]

url_scripts = [
  ["thrift", "https://svn.apache.org/repos/asf/thrift/trunk/contrib/thrift.vim", "syntax"]
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end

vim_org_zips.each do |name, script_id|
  puts "  Downloading #{name} ZIP"
  local_file = File.join(name, "#{name}.zip")
  local_dir = File.dirname(local_file)
  FileUtils.mkdir_p(local_dir)
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
  `cd #{local_dir} && unzip #{name}.zip`
end

url_scripts.each do |name, script_url, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open(script_url).read
  end
end
