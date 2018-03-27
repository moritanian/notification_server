class Todo < ApplicationRecord
    belongs_to :user 
    
    def Todo.create(user,todo_list)
        for @todo_data in todo_list do
            @todo_id = @todo_data['todo_id']
            @titleStr = CGI.unescape(@todo_data['titleStr'])
            @todoText = CGI.unescape(@todo_data['todoText'])
            @IsNotify = @todo_data['IsNotify']
            @IsMemo = @todo_data['IsMemo']
            @lookupTimeStr = @todo_data['lookupTimeStr']
            @notificationTimeStr = @todo_data['notificationTimeStr']
            @todoTimeStr = @todo_data['todoTimeStr']
            @user_id = user.user_id
            Todo.create!(user_id: @user_id, todo_id: @todo_id, titleStr: @titleStr, todoText: @todoText, IsNotify: @IsNotify,
                            IsMemo: @IsMemo, lookupTimeStr: @lookupTimeStr, notificationTimeStr: @notificationTimeStr,
                            todoTimeStr: @todoTimeStr)
        end
    end
    
    def Todo.serialize(todo_list)
        @result = []
        for @todo_data in todo_list do
            @ret = {}
            @ret['user_id'] = @todo_data['user_id']
            @ret['todo_id'] = @todo_data['todo_id']
            @ret['titleStr'] = CGI.escape( @todo_data['titleStr'])
            @ret['todoText'] = CGI.escape(@todo_data['todoText'])
            @ret['IsNotify'] = @todo_data['IsNotify'] == 1 ? true : false
            @ret['IsMemo'] = @todo_data['IsMemo'] == 1 ? true : false
            @ret['lookupTimeStr'] = @todo_data['lookupTimeStr']
            @ret['notificationTimeStr'] = @todo_data['notificationTimeStr']
            @ret['todoTimeStr'] = @todo_data['todoTimeStr']
            @result.push(@ret)
        end
        return @result
    end
end
