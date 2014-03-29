require 'benchmark/ips'
require_relative '../lib/gollum-lib.rb'

include Gollum

Benchmark.ips do |bm|
  bm.report("Page#cname short") do
    Page.cname("Bilbo Baggins".freeze)
  end

  bm.report("Page#cname long complicated") do
    Page.cname(("H<>el+lo " * 1024).freeze)
  end

  bm.report("Page#cname long simple") do
    Page.cname("Hello ".freeze)
  end

  bm.report("Page#cname unequal subs") do
    Page.cname(("H<>el+lo <" * 20).freeze, '_'.freeze, ''.freeze)
  end

  bm.report("Page#cname nil") do
    Page.cname(nil)
  end
end
