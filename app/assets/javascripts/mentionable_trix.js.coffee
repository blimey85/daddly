window.addEventListener "trix-initialize", (e) =>
  Utility.TrixMentions.prepare($(e.target))
