require 'rails_helper'

describe BooksController do
  render_views

  it 'can list reviews for a book' do
    book = create :book
    2.times { create :review, book: book }

    get :reviews, id: book.id
    expect( response.json.length ).to eq 2
  end

  it 'can list recieved recommendations' do
    me = create :user
    sign_in me

    friend = create :user
    me.friend! friend

    3.times { create :recommendation, sender: friend, recipient: me }
    get :recommendations
    expect( response.json.length ).to eq 3
  end

  it 'can index books' do
    2.times { create :book }
    get :index
    expect( response ).to be_successful
  end

  it 'can show a book' do
    book = create :book
    get :show, id: book.id
    expect( response ).to be_successful
  end

  it 'lets logged in users create books' do
    me = create :user
    sign_in me

    book_data = attributes_for :book
    post :create, book: book_data
    expect( response.json[:title] ).to eq book_data[:title]
    expect( response.json[:creator][:email] ).to eq me.email
  end

  it 'validates books' do
    me = create :user
    sign_in me

    book_data = attributes_for :book
    book_data[:title] = ''

    post :create, book: book_data
    expect( response.json[:errors] ).to be_present
    expect( response.status ).to eq 422
  end

  it 'requires users to be signed in to create books' do
    post :create, book: attributes_for(:book)
    expect( response ).not_to be_successful
    expect( Book.count ).to eq 0
  end

  it 'lets a user edit their own books' do
    me = create :user
    sign_in me

    book = create :book, creator: me
    post :update, id: book.id, book: { description: 'Updated' }
    expect( response.json[:description] ).to eq 'Updated'
  end

  it 'does not let a user edit another persons books' do
    me = create :user
    sign_in me

    book = create :book
    post :update, id: book.id, book: { description: 'Updated' }
    expect( response ).to be_redirect
    expect( book.reload.description ).not_to eq 'Updated'
  end

  it 'lets users review books' do
    me = create :user
    sign_in me

    book = create :book
    post :review, id: book.id, review: { rating: 3, text: 'Meh' }

    expect( response.json[:rating] ).to eq 3
    expect( book.reviews.last.rating ).to eq 3
  end

  it 'lets users recommend books to their friends' do
    me = create :user
    sign_in me

    bob = create :user
    bob.friend! me

    book = create :book

    post :recommend, id: book.id, recommendation: { text: 'Check it', recipient_id: bob.id }

    expect( response.json[:text] ).to eq 'Check it'
    expect( bob.received_recommendations.last.sender ).to eq me
  end
end
