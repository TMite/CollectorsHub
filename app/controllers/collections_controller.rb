class CollectionsController < ApplicationController 
    before_action :find_collection, only: [:show, :edit, :update, :destroy]
    before_action :find_collections, only: [:edit, :update, :destroy]
    def index
        if Current.user == nil
            redirect_to sign_in_path
        else
            @q = Collection.ransack(params[:q])
            @pagy, @collections = pagy(@q.result.order("created_at DESC"), items: 12)
        end
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
        # if Current.user.id != @collection.user_id
        #     redirect_to root_path, notice: "You can't access that collection"
        # end
        if Current.user.id != @collection.user_id && @collection.Private == true
            redirect_to collections_path, notice: "You can't access that collection"
        end
    end
  
    def edit
    
    end


    def update
        if @collection.update(collection_params)
            redirect_to @collection
        else
            render 'edit'
        end
    end
    def destroy
        @collection.delete
        redirect_to root_path
    end

    private

    def find_collection
        @collection = Collection.find(params[:id])
    end
    def find_collections
        @pagy, @collections = pagy(Current.user.collection.order("created_at DESC"))
    end
    def collection_params
        params.require(:collection).permit(:title, :Description, :SFW, :Private, :image, :AllTags, :all_tags, :user_id)
    end
    
end

