page_dir = File.expand_path(File.join(File.dirname(__FILE__)))
$: << page_dir

require 'erb_to_backbone_converter'
require 'erb_converter'
require 'erb_snippet_converter'
require 'erb_tree_cleaner'
require 'intermediate_creator'
require 'intermediate_view'
require 'intermediate_writer'
require 'template_view'
require 'treetop'