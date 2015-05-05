require('rspec')
require('pg')
require('list')
require('pry')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM lists *')
  end
end

describe(List) do

  describe("#name") do
    it("lets you give the list a name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end



  describe('#id') do
    it('returns the value of id') do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves the list") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same list if it has the same name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list).to(eq(list2))
    end
  end
end
