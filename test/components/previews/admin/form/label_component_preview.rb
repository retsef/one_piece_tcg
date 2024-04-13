class Admin::Form::LabelComponentPreview < ViewComponent::Preview
  class SampleModel
    include ActiveModel::Model
    attr_accessor :name
  end

  # @param label text
  def default(label: "Name")
    render Admin::Form::LabelComponent.new(
      form, :sample, label
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
