module Admin
  class UsersDatatable < ApplicationDatatable
    delegate :cv_section_path, to: :@view

    private

    def data
      users.map do |user|
        [].tap do |column|
          column << user.email
          column << "#{user.first_name} #{user.last_name}"
          column << user.tel
          column << link_to(user.subdomain, cv_section_path(user.subdomain), target: '_blank', rel: 'noopener')
          column << format_datetime(user.created_at)
        end
      end
    end

    def count
      User.count
    end

    def total_entries
      users.total_count
    end

    def users
      @users ||= fetch_users
    end

    def fetch_users
      users = User.datatable_filter(params['search']['value'], params['columns'])
      users = users.datatable_order(params['order']['0']['column'].to_i,
                                    params['order']['0']['dir'])
      users.page(page).per(per_page)
    end
  end
end
