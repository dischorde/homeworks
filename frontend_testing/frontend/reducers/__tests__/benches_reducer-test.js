/*
  NOTE: Our frontend state shape looks like this:
  {
    benches: {
      1: {
        id: 1,
        description: "...",
        lat: 0.0,
        lng: 0.0
      },
      2: {
        id: 2,
        description: "...",
        lat: 0.0,
        lng: 0.0
      },
      ...
    }
    ...
  }
*/

import BenchesReducer from '../benches_reducer';

const bench1 = { id: 1, description: "best!", lat: 1.2, lng: 3.4 };
const bench2 = { id: 2, description: "great!", lat: 5.6, lng: 7.8 };

describe('BenchesReducer', () => {

  test('should initialize with an empty object as the default state', () => {
    expect(BenchesReducer(undefined, {})).toEqual({});
  });

  describe('handling the RECEIVE_BENCHES action', () => {
    let action,
        emptyState,
        testBenches;

    beforeEach(() => {
      emptyState = {};
      testBenches = { 1: bench1, 2: bench2 };
      action = {
        type: 'RECEIVE_BENCHES',
        benches: testBenches
      };
    });

    test('should replace the state with the action\'s benches', () => {
      expect(BenchesReducer(emptyState, action)).toEqual(testBenches);
    });

    test('should not modify the old state', () => {
      BenchesReducer(emptyState, action);
      expect(emptyState).toEqual({});
    });
  });

  describe('handling the RECEIVE_BENCH action', () => {
    let action,
        emptyState;

    beforeEach(() => {
      emptyState = {};
      action = {
        type: 'RECEIVE_BENCH',
        bench: bench1
      };
    });

    test('should add the bench to the state nested under bench id', () => {
      expect(BenchesReducer(emptyState, action)[1]).toEqual(bench1)
    });

    test('should not modify the old state', () => {
      BenchesReducer(emptyState, action);
      expect(emptyState).toEqual({});
    });

  });
});
