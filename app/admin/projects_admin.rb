Trestle.resource(:projects) do
  menu do
    item :projects, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :thumb, header: false, class: "col-thumb" do |img|
        # image_tag(img.thumb.url)
      admin_link_to(image_tag(img.thumb.url, class: "img-responsive"), img) if img.thumb?
    end
    column :title
    column :created_at, align: :center
    actions
  end

  form do |project|
    text_field :title

    form_group :thumb, label: "作品縮圖", help: "圖片尺寸 1920x1080px" do
      concat content_tag(:div, nil, class: "previewimg", id: "thumbpreview"){ 
        concat image_tag(project.thumb.url, class: "thumbimg") if project.thumb.url
      }
      raw_file_field :thumb
    end


    fields_for :photos do |photo_form|
      # photo_form.text_field :name
      # project[photos_attributes][0][name]
      photo_form.raw_file_field :name, :multiple => true, class: "custom-file-input", id: "customFile"
    end
  
    row do
      col(xs: 6) { datetime_field :updated_at }
      col(xs: 6) { datetime_field :created_at }
    end
  end

  controller do 
    def update
      # logger.info "----------------------"
      # logger.info "info #{params[:project][:photos_attributes]}"
      # logger.info "----------------------"

      # if params[:project][:photos_attributes] != nil
        params[:project][:photos_attributes].each do |img|
          # @picture = instance.gallerys.create("name" => img)
          logger.info "----------------------"
          logger.info "img =  #{img}"
          logger.info "----------------------"
        end
      # end


    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  params do |params|
    params.require(:project).permit(:title, :thumb, photos_attributes: [:id, :name, :_destroy])
  end
end
