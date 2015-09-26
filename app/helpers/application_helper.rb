module ApplicationHelper
  def find_expense_types
    ExpenseType.all
  end
end
