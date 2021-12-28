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
          column << link_to(user.subdomain, cv_section_path(user.subdomain), target: :_blank)
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
      search_string = []
      columns.each do |term|
        search_string << "#{term} like :search"
      end

      users = User.order("#{sort_column} #{sort_direction}")
      search_params = users.sanitize_sql_for_conditions("%#{params[:search][:value]}%")
      users = users.where(search_string.join(' or '), search: search_params)
      users = users.page(page).per(per_page)
    end

    def columns
      %w[first_name last_name email tel]
    end
  end
end
