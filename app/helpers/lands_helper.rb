module LandsHelper
  def rotation_practice_table_data(land)
    if land.rotation_practice == 'No crop rotation.'
      'None'
    elsif land.rotation_practice == 'Intercropping.'
      'Intercropping'
    elsif land.rotation_practice == 'Crop rotation (less than 2 year cycles).'
      'Rotation'
    else
      '-'
    end
  end

  def tillage_method_table_data(land)
    if land.tillage_method == 'No tillage.'
      'None'
    elsif land.tillage_method == 'Reduced tillage.'
      'Reduced'
    elsif land.tillage_method == 'Conventional tillage.'
      'Conventional'
    else
      '-'
    end
  end
end
