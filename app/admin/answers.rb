ActiveAdmin.register Answer do

  member_action :new do
    @answer = Answer.new(question_id: params[:question_id])
  end

  form do |f|
    f.inputs "Content" do
      f.input :candidate
      f.input :question, member_label: :label
      f.input :body
   end
   f.actions
 end
end
