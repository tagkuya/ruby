class PortfoliosController < ApplicationController
    def index   
        @portfolio_items =Portfolio.all
    end

    def new 
        @portfolio_item = Portfolio.new    
    end

    def create
        @portfolio_item = Portfolio.new(reauire_parms_portfolio)
        
        respond_to do |format|
            if @portfolio_item.save 
                format.html{redirect_to portfolios_path, notice: 'Your Post is now live'}
            else
                format.html{ render :new }
            end
        end
    end

    def edit 
        @portfolio_item = Portfolio.find(params[:id])
    end

    def update
        @portfolio_item = Portfolio.find(params[:id])
        
        respond_to do |format|
            if @portfolio_item.update(reauire_parms_portfolio)
                format.html{redirect_to portfolios_path, notice: 'The record was successfully updated'}
            else
                format.html{ render :new }
            end
        end
    end
    
    private 
    def reauire_parms_portfolio
        params.require(:portfolio).permit(:title, :subtitle, :body)
    end

    
end
