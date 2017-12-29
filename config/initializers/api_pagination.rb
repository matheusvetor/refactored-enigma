ApiPagination.configure do |config|
  config.paginator = :will_paginate

  config.total_header = 'X-Total'

  config.per_page_header = 'X-Per-Page'

  config.page_header = 'X-Page'

  config.page_param = :page

  config.per_page_param = :per_page
end
