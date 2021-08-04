class CollectionsController < ApplicationController 
    before_action :find_collection, only: [:show, :edit, :update, :destroy]
    def index
        @collections = Collection.all.order("created_at DESC")
    end

    def new
        @collection = Collection.new
    end

    def create
        @collection = Collection.new(collection_params)
        if @collection.save 
            redirect_to @collection
        else
            render 'new'
        end
    end

    def show

    end
  
    def edit
    
    end

    def destroy
        @collection.destroy
        redirect_to root_path
    end

    private

    def find_collection
        @collection = Collection.find(params[:id])
      end
    def collection_params
        params.require(:collection).permit(:Title, :Description, :Height, :image, :user_id)
      end
end

