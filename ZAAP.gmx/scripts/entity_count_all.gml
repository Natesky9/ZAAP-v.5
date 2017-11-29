///entity_count_all()
//counts all entities in all lists

var count = 0
for (var i = 1;i < entity.types;i += 1)
    {
    var get_list = get(i);
    count += ds_list_size(get_list);
    }

return count
