module Admin
  class ApplicationDatatable
    delegate :params, to: :@view
    delegate :link_to, to: :@view

    def initialize(view)
      @view = view
    end

    def as_json(_options = {})
      {
        recordsTotal: count,
        recordsFiltered: total_entries,
        data: data
      }
    end

    private

    def page
      params[:start].to_i / per_page + 1
    end

    def per_page
      params[:length].to_i.positive? ? params[:length].to_i : 10
    end

    def format_datetime(datetime)
      return nil unless datetime
      datetime.strftime('%d/%m/%Y %T')
    end
  end
end
