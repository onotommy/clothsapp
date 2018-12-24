class HistoriesController < ApplicationController
    
#   def index
#     @histories = History.find_by(user_id: @current_user.id)
#   end
  
#   最近の投稿を表示する方法考え中。どのようにログインユーザーの投稿を表示するか。
  
  def new
   @history = History.new
   @cloth = Cloth.new
  end
  
  def create
      logger.debug("----------params=#{params[:situation]}")
      logger.debug("----------params=#{params[:brand]}")
      logger.debug("----------params=#{params[:brand_bottom]}")
      
     @his_save_success_flag = 1
    
    if params[:main_image]
     @history = History.new(
        wore_data: params[:wore_data], situation: params[:situation], memo: params[:memo], user_id: @current_user.id)
     if @history.save
        @history = History.last
        @history.main_image = "#{@history.id}.jpg"
      if @history.save
        image= params[:main_image]
        File.binwrite("public/history_images/#{@history.id}.jpg", image.read)
      @his_save_success_flag = 2
      end
     end
     
     if @his_save_success_flag == 2
         
       @cloth = Cloth.new(
         category: params[:category], brand: params[:brand], size: params[:size], color: params[:color] )
       if @cloth.save
          @history = History.last
          @cloth = Cloth.last
          @history_detail = HistoryDetail.new(
              hisotry_id: @history.id, cloth_id: @cloth.id)
        if@history_detail.save
         @his_save_success_flag = 3
        end
       end
     end
       
     if @his_save_success_flag == 3
        @cloth_bottom = Cloth.new(
        category: params[:category_bottom], brand: params[:brand_bottom], size: params[:size_bottom], color: params[:color_bottom])
      if @cloth_bottom.save
         @history = History.last
         @cloth = Cloth.last
         @history_detail = HistoryDetail.new(
              hisotry_id: @history.id, cloth_id: @cloth.id)
        if @history_detail.save
          redirect_to("/histories/#{@current_user.id}") 
        end
      end
     end
    end
  end
  
  def show
    @histories = History.where(user_id: params[:id])
  end 
  
  def edit
      @history = History.find(params[:id])
      @history_details = HistoryDetail.where(hisotry_id: params[:id])
      
      @history_details.each do |history_detail|
      @cloth = Cloth.where(id: history_detail.cloth_id )
     end
     
  end
  
  def update
      
  end

end