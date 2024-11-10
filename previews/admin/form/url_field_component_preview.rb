class Admin::Form::UrlFieldComponentPreview < ViewComponent::Preview
  class SampleModel
    include ActiveModel::Model
    attr_accessor :name
  end

  def default
    render Admin::Form::UrlFieldComponent.new(
      form, :sample, :name
    )
  end

  private

    def form
      OpenStruct.new(
        object: SampleModel.new,
        object_name: :name,
        options: {}
      )
    end
end
