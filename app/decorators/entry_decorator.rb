class EntryDecorator < Draper::Decorator
  delegate_all

  def tag_list_links
    source.tag_list.map do |t|
      h.link_to(t, h.tag_path(t))
    end.join(', ').html_safe
  end
end
