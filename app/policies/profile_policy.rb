class ProfilePolicy < ApplicationPolicy 
    def create?
    end

    def show?
        @user == record.user
    end

    def index?
        @user == record.user
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