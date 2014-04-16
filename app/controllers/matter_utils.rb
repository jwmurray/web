module MatterUtils

  def MatterDump(matter)
    puts "Dumping matter: " + matter.display_number.to_s
    puts matter.inspect.to_s
    puts "custom field values:"
    puts matter.custom_field_values.to_s
    @customFields = matter.custom_field_values;

    @customFields.each do |f| 
      puts "field id: " + f.custom_field_id.to_s + " type: " + f.type.to_s + "  value: " + 
        f.value.to_s
    end
  end

end
