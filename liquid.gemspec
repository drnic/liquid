Gem::Specification.new do |s|
  s.name = %q{liquid}
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tobias Luetke"]
  s.date = %q{2009-08-31}
  s.description = %q{A secure non evaling end user template engine with aesthetic markup.

Liquid is a template engine which I wrote for very specific requirements.

* It has to have beautiful and simple markup. 
  Template engines which don't produce good looking markup are no fun to use. 
* It needs to be non evaling and secure. Liquid templates are made so that users can edit them. You don't want to run code on your server which your users wrote. 
* It has to be stateless. Compile and render steps have to be seperate so that the expensive parsing and compiling can be done once and later on you can 
  just render it   passing in a hash with local variables and objects.}
  s.email = ["tobi@leetsoft.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = ["CHANGELOG", "History.txt", "MIT-LICENSE", "Manifest.txt", "README.rdoc", "Rakefile", "example/server/example_servlet.rb", "example/server/liquid_servlet.rb", "example/server/server.rb", "example/server/templates/index.liquid", "example/server/templates/products.liquid", "init.rb", "lib/extras/liquid_view.rb", "lib/liquid.rb", "lib/liquid/block.rb", "lib/liquid/condition.rb", "lib/liquid/context.rb", "lib/liquid/document.rb", "lib/liquid/drop.rb", "lib/liquid/errors.rb", "lib/liquid/extensions.rb", "lib/liquid/file_system.rb", "lib/liquid/htmltags.rb", "lib/liquid/module_ex.rb", "lib/liquid/standardfilters.rb", "lib/liquid/strainer.rb", "lib/liquid/tag.rb", "lib/liquid/tags/assign.rb", "lib/liquid/tags/capture.rb", "lib/liquid/tags/case.rb", "lib/liquid/tags/comment.rb", "lib/liquid/tags/cycle.rb", "lib/liquid/tags/for.rb", "lib/liquid/tags/if.rb", "lib/liquid/tags/ifchanged.rb", "lib/liquid/tags/include.rb", "lib/liquid/tags/unless.rb", "lib/liquid/template.rb", "lib/liquid/variable.rb", "liquid.gemspec", "performance/shopify.rb", "performance/shopify/comment_form.rb", "performance/shopify/database.rb", "performance/shopify/json_filter.rb", "performance/shopify/liquid.rb", "performance/shopify/money_filter.rb", "performance/shopify/paginate.rb", "performance/shopify/shop_filter.rb", "performance/shopify/tag_filter.rb", "performance/shopify/vision.database.yml", "performance/shopify/weight_filter.rb", "performance/tests/dropify/article.liquid", "performance/tests/dropify/blog.liquid", "performance/tests/dropify/cart.liquid", "performance/tests/dropify/collection.liquid", "performance/tests/dropify/index.liquid", "performance/tests/dropify/page.liquid", "performance/tests/dropify/product.liquid", "performance/tests/dropify/theme.liquid", "performance/tests/ripen/article.liquid", "performance/tests/ripen/blog.liquid", "performance/tests/ripen/cart.liquid", "performance/tests/ripen/collection.liquid", "performance/tests/ripen/index.liquid", "performance/tests/ripen/page.liquid", "performance/tests/ripen/product.liquid", "performance/tests/ripen/theme.liquid", "performance/tests/tribble/404.liquid", "performance/tests/tribble/article.liquid", "performance/tests/tribble/blog.liquid", "performance/tests/tribble/cart.liquid", "performance/tests/tribble/collection.liquid", "performance/tests/tribble/index.liquid", "performance/tests/tribble/page.liquid", "performance/tests/tribble/product.liquid", "performance/tests/tribble/search.liquid", "performance/tests/tribble/theme.liquid", "performance/tests/vogue/article.liquid", "performance/tests/vogue/blog.liquid", "performance/tests/vogue/cart.liquid", "performance/tests/vogue/collection.liquid", "performance/tests/vogue/index.liquid", "performance/tests/vogue/page.liquid", "performance/tests/vogue/product.liquid", "performance/tests/vogue/theme.liquid", "test/assign_test.rb", "test/block_test.rb", "test/condition_test.rb", "test/context_test.rb", "test/drop_test.rb", "test/error_handling_test.rb", "test/extra/breakpoint.rb", "test/extra/caller.rb", "test/file_system_test.rb", "test/filter_test.rb", "test/helper.rb", "test/html_tag_test.rb", "test/if_else_test.rb", "test/include_tag_test.rb", "test/module_ex_test.rb", "test/output_test.rb", "test/parsing_quirks_test.rb", "test/regexp_test.rb", "test/security_test.rb", "test/standard_filter_test.rb", "test/standard_tag_test.rb", "test/statements_test.rb", "test/strainer_test.rb", "test/template_test.rb", "test/test_helper.rb", "test/unless_else_test.rb", "test/variable_test.rb"]
  s.homepage = %q{http://www.liquidmarkup.org}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{liquid}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A secure non evaling end user template engine with aesthetic markup}
  s.test_files = ["test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
