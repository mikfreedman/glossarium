class EntriesController < ApplicationController
  before_action :set_collection
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @entries = @collection.entries.tagged_with(params[:tag]).decorate
    else
      @entries = @collection.entries.decorate
    end
  end

  def show; end

  def new
    @entry = Entry.new(collection: @collection)
  end

  def edit; end

  def create
    @entry = Entry.new(entry_params.merge(collection: @collection))

    respond_to do |format|
      if @entry.save
        format.html { redirect_to [@collection, @entry], notice: 'Entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to [@collection, @entry], notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to collection_entries_url(@collection) }
      format.json { head :no_content }
    end
  end

  private
  def set_collection
    @collection = Collection.friendly.find(params[:collection_id]).decorate
  end

  def set_entry
    @entry = @collection.entries.friendly.find(params[:id]).decorate
  end

  def entry_params
    params.require(:entry).permit(:name, :tag_list)
  end
end
