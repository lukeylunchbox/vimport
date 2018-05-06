class ProposalPolicy < ApplicationPolicy 
    def create?
    end

    def show?
    end

    def edit?
        @user == record.user
    end

    def destroy?
        @user == record.user
    end

    def update?
        @user == record.user
    end

    def new?
    end
end