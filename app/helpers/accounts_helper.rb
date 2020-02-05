module AccountsHelper
def check_current_login(id)
    return true if current_account.id == id
  end
end
