require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
  let(:good) { create(:good) }

  describe 'Get #index' do
    let(:goods) { create_list(:good, 2) }

    before do
      get :index
    end

    it 'array of all qoods' do
      expect(assigns(:goods)).to match_array(@goods)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'Get #show' do

    before do
      get :show, params: { id: good }
    end

    it 'assigns the requested good to @good' do
      expect(assigns(:good)).to eq good
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'Get #new' do
    login_user
    before { get :new }

    it 'assigns a new Qood to @good' do
      expect(assigns(:good)).to be_a_new(Good)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'Get #edit' do
    login_user
    before { get :edit, params: { id: good } }

    it 'assigns the requested good to @good' do
      expect(assigns(:good)).to eq good
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    login_user
    context 'with valid attributes' do
      it 'saves the new good in the database' do
        expect { post :create, params: { good: attributes_for(:good) } }
            .to change(Good, :count).by(+1)
      end

      it 'redirects to show view' do
        post :create, params: { good: attributes_for(:good) }
        # expect(response).to redirect_to good_path(assigns(:good)) # Если перенаправление на :show
        expect(response).to redirect_to goods_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the good' do
        expect { post :create, params: { good: attributes_for(:invalid_good) } }.to_not change(Good, :count)
      end

      it 're-renders new view' do
        post :create, params: { good: attributes_for(:invalid_good) }
        expect(response).to render_template :new
      end
    end
  end
  
  describe 'PATCH #update' do
    login_user
    context 'valid attributes' do
      it 'assings the requested good to @good' do
        patch :update, params: { id: good, good: attributes_for(:good) }
        expect(assigns(:good)).to eq good
      end

      it 'changes good attributes' do
        patch :update, params: { id: good, good: { name: 'new name', comment: 'new comment' } }
        good.reload
        expect(good.name).to eq 'new name'
        expect(good.comment).to eq 'new comment'
      end

      it 'redirects to the updated good' do
        patch :update, params: { id: good, good: attributes_for(:good) }
        # expect(response).to redirect_to good # eсли перенаправляется на good
        expect(response).to redirect_to goods_path
      end
    end

    context 'invalid attributes' do
      login_user
      before { patch :update, params: { id: good, good: { name: nil, comment: 'new comment' } } }

      it 'does not change good attributes' do
        good.reload
        expect(good.name).to eq 'MyName'
        expect(good.comment).to eq 'MyComment'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    login_user
    before { good }

    it 'deletes good' do
      expect { delete :destroy, params: { id: good } }.to change(Good, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: good }
      expect(response).to redirect_to goods_path
    end
  end
end
