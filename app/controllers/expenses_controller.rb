class ExpensesController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  before_filter :find_expense, except: [:index, :new, :create]
  def smart_listing_resource
    @expense ||= params[:id] ? Expense.find(params[:id]) : Expense.new(params[:expense])
  end
  helper_method :smart_listing_resource

  def smart_listing_collection
    @expenses ||= params[:filter] ? Expense.like(params[:filter]) : Expense.all
  end

  helper  SmartListing::Helper

  def index
    smart_listing_create partial: "expenses/list",
                         default_sort: {expense_date: "asc"}
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
  end

  def edit
  end

  def update
    @expense.update_attributes(expense_params)
  end

  def destroy
    @expense.destroy
  end

  private

  def find_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:expense_date, :payee, :expense_type_id,
                                    :description, :amount)
  end
end