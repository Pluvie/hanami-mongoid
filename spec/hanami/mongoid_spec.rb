RSpec.describe Hanami::Mongoid do
  it "has a version number" do
    expect(Hanami::Mongoid::VERSION).not_to be nil
  end

  context "when defining a repository for an entity" do

    class Entity; include Mongoid::Document end
    class EntityRepository < Hanami::Mongoid::Repository; end

    let(:repository) { EntityRepository.new }

    it "adds a :find method to the EntityRepository class" do
      expect(repository.respond_to? :find).to be true
    end
    it "adds a :find_by method to the EntityRepository class" do
      expect(repository.respond_to? :find_by).to be true
    end
    it "adds a :where method to the EntityRepository class" do
      expect(repository.respond_to? :where).to be true
    end
    it "adds a :any_of method to the EntityRepository class" do
      expect(repository.respond_to? :any_of).to be true
    end
    it "adds a :all method to the EntityRepository class" do
      expect(repository.respond_to? :all).to be true
    end
    it "adds a :first method to the EntityRepository class" do
      expect(repository.respond_to? :first).to be true
    end
    it "adds a :last method to the EntityRepository class" do
      expect(repository.respond_to? :last).to be true
    end
    it "adds a :create method to the EntityRepository class" do
      expect(repository.respond_to? :create).to be true
    end
    it "adds a :destroy_all method to the EntityRepository class" do
      expect(repository.respond_to? :destroy_all).to be true
    end
    it "adds a :delete_all method to the EntityRepository class" do
      expect(repository.respond_to? :delete_all).to be true
    end
    it "adds a :update_all method to the EntityRepository class" do
      expect(repository.respond_to? :update_all).to be true
    end
    it "adds a :destroy method to the EntityRepository class" do
      expect(repository.respond_to? :destroy).to be true
    end
    it "adds a :delete method to the EntityRepository class" do
      expect(repository.respond_to? :delete).to be true
    end
    it "adds a :update_attributes method to the EntityRepository class" do
      expect(repository.respond_to? :update_attributes).to be true
    end
    it "adds a :update method to the EntityRepository class" do
      expect(repository.respond_to? :update).to be true
    end
    it "adds a :insert_many method to the EntityRepository class" do
      expect(repository.respond_to? :insert_many).to be true
    end
    it "adds a :delete_many method to the EntityRepository class" do
      expect(repository.respond_to? :insert_many).to be true
    end
    it "adds a :aggregate method to the EntityRepository class" do
      expect(repository.respond_to? :aggregate).to be true
    end

  end
end
