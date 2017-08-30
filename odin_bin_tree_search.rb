class Node    
    attr_accessor :value, :parent, :left_child, :right_child
    def initialize(value, parent=nil, left_child=nil, right_child=nil)
        @value = value
        @parent = parent
        @left_child = left_child
        @right_child = right_child
    end
end
# Array presorted recursive

def build_tree_pre_rec(arr,parent=nil)
    return if arr.empty?
    mid = (0 + arr.length - 1 )/2
    node = Node.new(arr[mid],parent)
    left = arr.slice(0,mid)
    right = arr.slice(mid+1, arr.length)   
    node.left_child = build_tree_pre_rec(left,node)
    node.right_child = build_tree_pre_rec(right,node)
    return node
end

#Array unsorted non-recursive
def build_tree_non_rec(arr,parent=nil)
    return if arr.empty?
    root = Node.new(arr.shift)
    count = 0
    while count < arr.length
        current = root
        data = arr[count]
        while current.right_child != nil && data > current.value
            current = current.right_child
            p current.value
        end
        while current.left_child != nil && data < current.value
            current = current.left_child
        end
        if data > current.value
            current.right_child = Node.new(data,current)
        else
            current.left_child = Node.new(data,current)
        end
        count +=1
    end
    return root
end

# Array unsorted recursive
def build_tree_rec(arr, root=nil)
    return if arr.empty?
    root ||= Node.new(arr.shift)
    if arr[0] > root.value
        if root.right_child.nil?
            root.right_child = Node.new(arr[0],root)
        else
            current = root.right_child
            build_tree_rec(arr1=[arr[0]],current)
        end
    else
        if root.left_child.nil?
            root.left_child = Node.new(arr[0],root)
        else
            current = root.left_child
            build_tree_rec(arr1=[arr[0]],current)
        end
    end
    arr.shift
    build_tree_rec(arr,root)
    return root
end

def breadth_first_search(tofind, node, disc=[], visit=[])
    found = 'nil'
    return if node === nil
    if disc.empty?
        disc << node
    end
    disc << node.left_child if node.left_child
    disc << node.right_child if node.right_child    
    visit << disc.shift
    if visit[visit.length-1].value === tofind
        return visit[visit.length-1]  
    end
    breadth_first_search(tofind,disc[0],disc,visit)
    return found
end

def depth_first_search(target,node)
    if node.value === target
        return node.value
    end
    if node.left_child
        depth_first_search(target,node.left_child)
    end
    if node.right_child
        depth_first_search(target,node.right_child)
    end
end

z = build_tree_rec([8,3,10,1,6,4,7,14,13])
# puts breadth_first_search(15,z)
p depth_first_search(10,z)