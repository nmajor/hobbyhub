class Visual < Trait

  def is_video?
    ref.include?('youtu')
  end
end
