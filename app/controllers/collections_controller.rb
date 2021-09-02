class CollectionsController < ApplicationController 
    before_action :find_collection, only: [:show, :edit, :update, :destroy]
    before_action :find_collections, only: [:show, :edit, :update, :destroy]
    def index
        if Current.user == nil
            redirect_to sign_in_path
        else
        @pagy, @collections = pagy(Collection.where(user_id: Current.user.id).order("created_at ASC"), items: 9)
        #@pagy, @collections = pagy(Collection.)
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
        if Current.user.id != @collection.user_id
            redirect_to collections_path, notice: "You can't access that collection"
        end
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
    def find_collections
        @pagy, @collections = pagy(Collection.all.order("created_at ASC"))
    end

    def collection_params
        params.require(:collection).permit(:Title, :Description, :Height, :image, :user_id)
    end
end

