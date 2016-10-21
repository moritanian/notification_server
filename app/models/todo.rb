class Todo < ApplicationRecord
    def Todo.createByJson(json)
        @data = JSON.parse(json)
        p "this is a "
        p @data
        @todo_list = @data['target']
        for @todo_data in @todo_list do
            @user_id = @todo_data['user_id'] ? @data['user_id'] : 1
            @titleStr = CGI.unescape(@todo_data['titleStr'])
            @todoText = CGI.unescape(@todo_data['todoText'])
            @IsNotify = @todo_data['IsNotify']
            @IsMemo = @todo_data['IsMemo']
            @lookUpTimeStr = @todo_data['lookUpTimeStr']
            @notificationTimeStr = @todo_data['notificationTimeStr']
            @todoTimeStr = @todo_data['todoTimeStr']
            Todo.create!(user_id: @user_id, titleStr: @titleStr, todoText: @todoText, IsNotify: @IsNotify,
                            IsMemo: @IsMemo, lookUpTimeStr: @lookUpTimeStr, notificationTimeStr: @notificationTimeStr,
                            todoTimeStr: @todoTimeStr)
        end
    end
end
