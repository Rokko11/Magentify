When /^I execute magentify \.$/ do
  Dir.chdir(@src_dir) do
    system "magentify . > /dev/null 2>&1"
  end
end

Then /^Capfile should load mage\.rb$/ do
  File.open(File.join(@src_dir, "Capfile"), 'rb').read().match('mage\.rb').should be_true
end

Then /^Gemfile should load the magentify gem$/ do
  File.open(File.join(@src_dir, "Gemfile"), 'rb').read().match('magentify').should be_true
end

When /^I execute cap \-T$/ do
  Dir.chdir(@src_dir) do
    system "cap -T > /dev/null 2>&1"
  end
end

Then /^mage tasks should be listed$/ do
  Dir.chdir(@src_dir) do
    result = %x[cap -T]
    result.match('Clear the Magento Cache').should be_true
  end
end
