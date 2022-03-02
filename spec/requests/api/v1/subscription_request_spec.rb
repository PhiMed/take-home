require 'rails_helper'

describe 'Subscription API' do
  it 'can subscribe a customer to a tea subscription' do
    customer_1 = Customer.create(first_name: "Steve")
    customer_2 = Customer.create(first_name: "Joe")
    subscription_1 = Subscription.create
    subscription_2 = Subscription.create
    subscription_3 = Subscription.create
    Tea.create(subscription_id: subscription_1.id)
    Tea.create(subscription_id: subscription_2.id)
    Tea.create(subscription_id: subscription_3.id)

    get "/api/v1/customers/#{customer_1.id}"

    data = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(data[:attributes][:subscriptions].count).to eq 0
    
    post "/api/v1/customer_subscriptions?customer_id=#{customer_1.id}&subscription_id=#{subscription_1.id}"

    get "/api/v1/customers/#{customer_1.id}"
  
    data = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(data[:attributes][:subscriptions].count).to eq 1
  end

  it 'can cancel a customers subscription' do 
    customer_1 = Customer.create(first_name: "Steve")
    subscription_1 = Subscription.create
    subscription_2 = Subscription.create
    Tea.create(subscription_id: subscription_1.id)
    Tea.create(subscription_id: subscription_2.id)
    customer_subscription_1 = CustomerSubscription.create(subscription_id: subscription_1.id, customer_id: customer_1.id)
    customer_subscription_2 =CustomerSubscription.create(subscription_id: subscription_2.id, customer_id: customer_1.id)     
  
    get "/api/v1/customers/#{customer_1.id}"

    data = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(data[:attributes][:subscriptions].count).to eq 2

    delete "/api/v1/customer_subscriptions/#{customer_subscription_1.id}"

     get "/api/v1/customers/#{customer_1.id}"

    data = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(data[:attributes][:subscriptions].count).to eq 1    
  end
end