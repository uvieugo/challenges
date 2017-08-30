class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(8){ Array.new(8,"  ")}
    end
end

class Mytree
    attr_accessor :data, :neighbor, :seeder
    def initialize(data,seeder=nil,neighbor=[])
        @data = data
        @seeder = seeder
        @neighbor = neighbor
    end
end

class Knight
    attr_accessor :pos, :moves
    def initialize
        @moves = [
            [1,2],
            [2,1],
            [1,-2],
            [2,-1],
            [-1,2],
            [-1,-2],
            [-2,1],
            [-2,-1]
        ]
    end

    def move_list_pos(pos)
         @moves.select do |move|
            (pos[0]+move[0]).between?(0,7) && (pos[1]+move[1]).between?(0,7)
        end.map do |move|
            [pos[0]+move[0],pos[1]+move[1]]
        end
    end

    def moves(initial,target,search=[],searched=[])
        if initial === target
            return "same position" if search.empty?
            x = search[0]
            path = []
            while x.seeder
                path.unshift x.seeder.data
                x = x.seeder
            end
            path << initial
            return path
        end

        if search.empty?
            node = Mytree.new(initial)
            move_list_pos(initial).each do |list|
                node.neighbor << Mytree.new(list,node)
            end
            search << node
        else
             move_list_pos(initial).each do |list|
                search[0].neighbor << Mytree.new(list,search[0])
            end
        end

        search[0].neighbor.each do |item|
            if !searched.include?(item.data)
                search << item
            end
        end

        searched << search[0].data
        search.shift
        moves(search[0].data,target,search,searched)
    end
end

player = Knight.new
p player.moves([3,3],[4,3])
