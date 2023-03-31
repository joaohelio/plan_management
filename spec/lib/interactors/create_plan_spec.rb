require '/app/lib/interactors/create_plan'

RSpec.describe PlanManagement::Interactors::CreatePlan do
  let(:plan_repo) { double('plan_repo') }

  subject { described_class.new(plan_repo: plan_repo) }

  describe '#execute' do
    it 'creates a new plan with the given params' do
      params = { name: 'Test Plan', price: 10 }
      plan = double('plan', params)

      allow(plan_repo).to receive(:create).with(params).and_return(plan)

      result = subject.execute(params)

      expect(result).to eq(plan)
    end
  end
end
