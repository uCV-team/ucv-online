module Admin
  class FlagsDatatable < Admin::ApplicationDatatable
    delegate :cv_section_path, to: :@view

    private

    def data
      flags.includes(:user, cv: [:user]).map do |flag|
        [].tap do |column|
          column << link_to(flag.cv.full_name, cv_section_path(flag.cv.subdomain), target: :_blank) if flag.cv.present?
          column << flag.user.full_name if flag.user.present?
          column << flag.reason
          column << format_datetime(flag.created_at)
        end
      end
    end

    def count
      Flag.count
    end

    def total_entries
      flags.total_count
    end

    def flags
      @flags ||= fetch_flags
    end

    def fetch_flags
      search_string = []
      columns.each do |term|
        search_string << "#{term} like :search"
      end

      flags = Flag.order("#{sort_column} #{sort_direction}")
      search_params = flags.sanitize_sql_for_conditions("%#{params[:search][:value]}%")
      flags = flags.where(search_string.join(' or '), search: search_params)
      flags = flags.page(page).per(per_page)
    end

    def columns
      %w[reason]
    end

    def format_datetime(datetime)
      return nil unless datetime
      datetime.strftime('%d/%m/%Y %T')
    end
  end
end
