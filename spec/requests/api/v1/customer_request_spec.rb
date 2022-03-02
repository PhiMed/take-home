require 'rails_helper'

describe 'Customers API' do
  it 'can get all of a customers subscriptions' do
    customer_1 = Customer.create(first_name: "Steve")
    customer_2 = Customer.create(first_name: "Joe")
    subscription_1 = Subscription.create
    subscription_2 = Subscription.create
    subscription_3 = Subscription.create
    Tea.create(subscription_id: subscription_1.id)
    Tea.create(subscription_id: subscription_2.id)
    Tea.create(subscription_id: subscription_3.id)
    CustomerSubscription.create(subscription_id: subscription_1.id, customer_id: customer_1.id)
    CustomerSubscription.create(subscription_id: subscription_2.id, customer_id: customer_1.id)     
    CustomerSubscription.create(subscription_id: subscription_3.id, customer_id: customer_2.id)

    get "/api/v1/customers/#{customer_1.id}"

    expect(response).to be_successful

    data = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(data[:attributes][:subscriptions].count).to eq 2
    
    get "/api/v1/customers/#{customer_2.id}"

    data = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(data[:attributes][:subscriptions].count).to eq 1
  end
end