require('spec_helper')

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

  describe(".find") do
    it("returns a list by its ID") do
      test_list = List.new({:name => "Epicodus Stuff", :id => nil})
      test_list.save()
      test_list2 = List.new({:name => "Home stuff", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "Learn SQL", :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end










end
