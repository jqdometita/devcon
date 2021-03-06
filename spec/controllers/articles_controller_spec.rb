require 'spec_helper'

describe ArticlesController do

  let :valid_attributes do
    { :title => "Test title", :content => "Test Content" }
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "#create" do
    before do
      sign_in(Fabricate(:author))
    end

    it "should allow creation of article" do
      post :create,
        :article => valid_attributes
      response.should redirect_to(Article.last)
    end

    it "should not allow saving of categories" do

      category1 = Fabricate(:category)
      category2 = Fabricate(:category)

      post :create,
        :article => valid_attributes.merge({:category_ids => [category1.id, category2.id] })
      assigns(:article).category_ids.size.should == 2
    end

    it "should not allow editing of author_id" do
      post :create,
        :article => valid_attributes.merge({:author_id => 42 })
      assigns(:article).author_id.should_not == 42
    end
  end

  describe "#update" do
    before do
      @author = Fabricate(:author)
      sign_in(@author)
      @article = Fabricate(:article, :author => @author)
    end

    it "should allow creation of article" do
      put :update,
        :id => @article.slug,
        :article => valid_attributes
      response.should redirect_to(Article.last)
    end

    it "should not allow saving of categories" do

      category1 = Fabricate(:category)
      category2 = Fabricate(:category)

      put :update,
        :id => @article.slug,
        :article => valid_attributes.merge({:category_ids => [category1.id, category2.id] })
      assigns(:article).category_ids.size.should == 2
    end

    it "should not allow editing of author_id" do
      put :update,
        :id => @article.slug,
        :article => valid_attributes.merge({:author_id => 42 })
      assigns(:article).author_id.should_not == 42
    end

  end
end
