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

    private 
    def reauire_parms_portfolio
        params.require(:portfolio).permit(:title, :subtitle, :body)
    end

end
