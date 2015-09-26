class ExpenseTypesController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  before_filter :find_expense_type, except: [:index, :new, :create]
  def smart_listing_resource
    @expense_type ||= params[:id] ? ExpenseType.find(params[:id]) : ExpenseType.new(params[:expense_type])
  end
  helper_method :smart_listing_resource

  def smart_listing_collection
    @expense_types ||= params[:filter] ? ExpenseType.like(params[:filter]) : ExpenseType.all
  end

  helper  SmartListing::Helper

  def index
    smart_listing_create partial: "expense_types/list",
                         default_sort: {name: "asc"}
  end

  def new
    @expense_type = ExpenseType.new
  end

  def create
    @expense_type = ExpenseType.create(expense_type_params)
  end

  def edit
  end

  def update
    @expense_type.update_attributes(expense_type_params)
  end

  def destroy
    @expense_type.destroy
  end

  private

  def find_expense_type
    @expense_type = ExpenseType.find(params[:id])
  end

  def expense_type_params
    params.require(:expense_type).permit(:name)
  end
end