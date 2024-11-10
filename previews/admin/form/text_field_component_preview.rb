class Admin::Form::TextFieldComponentPreview < ViewComponent::Preview
  class SampleModel
    include ActiveModel::Model
    attr_accessor :name
  end

  def default
    render Admin::Form::TextFieldComponent.new(
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
