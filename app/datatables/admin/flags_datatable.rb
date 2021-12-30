module Admin
  class FlagsDatatable < Admin::ApplicationDatatable
    delegate :cv_section_path, to: :@view

    private

    def data
      flags.includes(:user, cv: [:user]).map do |flag|
        [].tap do |column|
          column << link_to(flag.cv.full_name, cv_section_path(flag.cv.subdomain), target: '_blank', rel: 'noopener')
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
      flags = Flag.datatable_filter(params['search']['value'], params['columns'])
      flags = flags.datatable_order(params['order']['0']['column'].to_i,
                                    params['order']['0']['dir'])
      flags.page(page).per(per_page)
    end
  end
end
