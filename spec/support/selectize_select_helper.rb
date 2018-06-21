module SelectizeSelectHelper
  def find_selectized_control_js(key)
    %{ $('##{key}.selectized').next('.selectize-control') }.strip
  end

  # Select a single item from a selectized select input where multiple=false given the id for base field
  def selectize_single_select(key, value)
    # It may be tempting to combine these into one execute_script, but don't; it will cause failures.
    page.execute_script %{ #{find_selectized_control_js(key)}.find('.selectize-input').click(); }
    page.execute_script %{ #{find_selectized_control_js(key)}.find('.selectize-dropdown-content .option:contains("#{value}")').click(); }
  end

  # Select one or more items from a selectized select input where multiple=true.
  def selectize_multi_select(key, *values)
    values.flatten.each do |value|
      page.execute_script(%{
                          #{find_selectized_control_js(key)}.find('input').val('#{value}');
      $('##{key}.selectized')[0].selectize.createItem();
    })
    end
  end

  def selectize_click(id)
    selectize_within(id) do
      first('div.selectize-input').click
    end
  end

  def select_option(id, text)
    selectize_within(id) do
      first('div.selectize-input').click
      find('div.option', text: text).click
    end
  end

  def set_text(id, text)
    selectize_within(id) do
      first('div.selectize-input input').set(text)
    end
  end

  def selectize_within(id)
    within(:xpath, "//input[@id='#{id}']/..") do
      yield if block_given?
    end
  end
end
