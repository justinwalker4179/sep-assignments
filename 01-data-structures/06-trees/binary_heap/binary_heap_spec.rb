include RSpec

require_relative 'binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Movie.new("Aliens", 98) }
  let (:breakfast) { Movie.new("The Breakfast Club", 92) }
  let (:heap) { BinaryHeap.new(root) }
  let (:mirror) { Movie.new("Mirrormask",54)}
  let (:pan) { Movie.new("Pan's Labyrinth", 95) }
  let (:army) { Movie.new("Army of Darkness", 72) }
  let (:blade) { Movie.new("Blade Runner", 90) }
  let (:tron) { Movie.new("Tron", 70) }
  let (:wrath) { Movie.new("Wrath of the Titans", 26) }
  let (:ghost) { Movie.new("Ghostbusters", 97) }
  let (:pulp) { Movie.new("Pulp Fiction", 94) }
  let (:vendetta) { Movie.new("V for Vendetta", 73) }
  let (:hellboy) { Movie.new("Hellboy II: The Golden Army", 86) }
  let (:metropolis) { Movie.new("Metropolis", 99)}

  describe "#insert(data)" do
    it "properly inserts a lower rated node" do
      heap.insert(wrath)
      expect(heap.heap[2].title).to eq "Wrath of the Titans"
    end

    it "properly inserts a higher rated node" do
      heap.insert(metropolis)
      expect(heap.heap[1].title).to eq "Metropolis"
    end

    it "properly adds items in along a row" do
      heap.insert(army)
      heap.insert(mirror)
      expect(heap.heap[3].title).to eq ("Mirrormask")
    end

    it "properly adds to beginning of next row when a row is full" do
      heap.insert(army)
      heap.insert(mirror)
      heap.insert(wrath)
      expect(heap.heap[4].title).to eq "Wrath of the Titans"
    end
  end

  describe "#delete(data)" do
    it "deletes node and fills the space successfully" do

    end
    it "deletes root and fills the space successfully" do
      heap.insert(army)
      heap.insert(mirror)
      heap.delete("Aliens")
      expect(heap.heap[1].title).to eq "Army of Darkness"
    end

  end

  describe "#print()" do
    specify {
      expected_output = "Metropolis: 99\nAliens: 98\nGhostbusters: 97\nPan's Labyrinth: 95\nPulp Fiction: 94\nBlade Runner: 90\nThe Breakfast Club: 92\nHellboy II: The Golden Army: 86\nV for Vendetta: 73\nArmy of Darkness: 72\nTron: 70\nMirrormask: 54\nWrath of the Titans: 26\n"
      heap.insert(metropolis)
      heap.insert(ghost)
      heap.insert(pan)
      heap.insert(pulp)
      heap.insert(blade)
      heap.insert(breakfast)
      heap.insert(hellboy)
      heap.insert(vendetta)
      heap.insert(army)
      heap.insert(tron)
      heap.insert(mirror)
      heap.insert(wrath)
      expect { heap.print() }.to output(expected_output).to_stdout
    }
  end
end