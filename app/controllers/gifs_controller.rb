class GifsController < ApplicationController
  # GET /gifs
  # GET /gifs.json
  def index
    @gifs = Gif.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @gifs }
    end
  end

  # GET /gifs/1
  # GET /gifs/1.json
  def show
    @gif = Gif.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @gif }
    end
  end

  # GET /gifs/new
  # GET /gifs/new.json
  def new
    @gif = Gif.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gif }
    end
  end

  # GET /gifs/1/edit
  def edit
    @gif = Gif.find(params[:id])
  end

  # POST /gifs
  # POST /gifs.json
  def create
    @gif = Gif.new(params[:gif])

    respond_to do |format|
      if @gif.save
        format.html { redirect_to @gif, :notice => 'Gif was successfully created.' }
        format.json { render :json => @gif, :status => :created, :location => @gif }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gif.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gifs/1
  # PUT /gifs/1.json
  def update
    @gif = Gif.find(params[:id])

    respond_to do |format|
      if @gif.update_attributes(params[:gif])
        format.html { redirect_to @gif, :notice => 'Gif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @gif.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gifs/1
  # DELETE /gifs/1.json
  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy

    respond_to do |format|
      format.html { redirect_to gifs_url }
      format.json { head :no_content }
    end
  end
  
  def moderate
    @gif = Gif.find(params[:id])
    puts "hey"
    puts @gif.url
    @gif.moderated = true
    @gif.save
    
    @gif2 = Gif.next(@gif).first
    puts "GOT ONE"
    #puts @gif2.url
    puts @gif2
    puts "URL"
    redirect_to( :action => 'show', :id => @gif2.id )
  end
end
