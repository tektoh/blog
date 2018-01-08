module MediumDecorator
  def image_url(version = :origin)
    return nil if !image? || !attachment.attached? || attachment.metadata.blank?

    command = case version
                when :thumb
                  { resize: '640x480' }
                when :lg
                  { resize: '1024x768' }
                else
                  false
              end

    (command ? attachment.variant(command).processed : attachment).service_url(expires_in: 100.years)
  end
end
