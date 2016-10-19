class Todo < ApplicationRecord
    def Todo.createByJson(json)
        @data = JSON.parse(json)
        @user_id = @data['user_id'] ? @data['user_id'] : 1
        @titleStr = URI.decode(@data['titleStr'])
        @todoText = URI.decode(@data['todoText'])
        @IsNotify = @data['IsNotify']
        @IsMemo = @data['IsMemo']
        @lookUpTimeStr = @data['lookUpTimeStr']
        @notificationTimeStr = @data['notificationTimeStr']
        @todoTimeStr = @data['todoTimeStr']
        Todo.create!(user_id: @user_id, titleStr: @titleStr, todoText: @todoText, IsNotify: @IsNotify,
                        IsMemo: @IsMemo, lookUpTimeStr: @lookUpTimeStr, notificationTimeStr: @notificationTimeStr,
                        todoTimeStr: @todoTimeStr)
    end
end
